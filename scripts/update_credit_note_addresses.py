from pathlib import Path

path = Path(r'c:\xampp\htdocs\duolab\db\db_duolab.sql')
text = path.read_text(encoding='utf-8')
start_token = "INSERT INTO `tbl_credit_note`"
idx = 0
out = []

while True:
    s = text.find(start_token, idx)
    if s == -1:
        out.append(text[idx:])
        break
    out.append(text[idx:s])
    semicolon = text.find(';', s)
    if semicolon == -1:
        raise RuntimeError('No end semicolon found for tbl_credit_note insert block')
    block = text[s:semicolon+1]
    lines = block.splitlines()
    new_lines = []
    for line in lines:
        stripped = line.strip()
        if stripped.startswith('(') and (stripped.endswith(',') or stripped.endswith(';')):
            # parse fields respecting single-quoted strings
            fields = []
            cur = ''
            in_string = False
            i = 0
            while i < len(line):
                c = line[i]
                if c == "'":
                    cur += c
                    i += 1
                    while i < len(line):
                        cur += line[i]
                        if line[i] == "'":
                            if i + 1 < len(line) and line[i + 1] == "'":
                                i += 2
                                continue
                            i += 1
                            break
                        i += 1
                    continue
                if c == ',' and not in_string:
                    fields.append(cur)
                    cur = ''
                    i += 1
                    continue
                cur += c
                i += 1
            if cur:
                fields.append(cur)
            if len(fields) >= 10:
                fields[9] = " 'CALLE UNIVERSITARIA 1234 - SANTA CRUZ DE LA SIERRA'"
                new_lines.append(','.join(fields))
                continue
        new_lines.append(line)
    out.append('\n'.join(new_lines))
    idx = semicolon + 1

path.write_text(''.join(out), encoding='utf-8')
print('Updated tbl_credit_note addresses')
