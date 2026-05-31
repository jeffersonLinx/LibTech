from pathlib import Path
import re

path = Path(r'c:\xampp\htdocs\duolab\db\db_duolab.sql')
text = path.read_text(encoding='utf-8')
start_token = "INSERT INTO `tbl_credit_note`"
idx = 0
out_parts = []
while True:
    start = text.find(start_token, idx)
    if start == -1:
        out_parts.append(text[idx:])
        break
    out_parts.append(text[idx:start])
    end = text.find(';', start)
    if end == -1:
        raise RuntimeError('Missing semicolon for tbl_credit_note insert block')
    block = text[start:end+1]
    lines = block.splitlines()
    new_lines = []
    pattern = re.compile(r"^(\s*\(\d+,\s*'[^']*',\s*'[^']*',\s*\d+,\s*\d+,\s*\d+,\s*\d+,\s*'[^']*',\s*)'[^']*'(\s*,.*)$")
    for line in lines:
        if line.strip().startswith('('):
            m = pattern.match(line)
            if m:
                new_line = m.group(1) + "'CALLE UNIVERSITARIA 1234 - SANTA CRUZ DE LA SIERRA'" + m.group(2)
                new_lines.append(new_line)
                continue
        new_lines.append(line)
    out_parts.append('\n'.join(new_lines))
    idx = end + 1
path.write_text(''.join(out_parts), encoding='utf-8')
print('tbl_credit_note addresses updated successfully')
