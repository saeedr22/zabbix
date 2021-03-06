ALTER TABLE rights ALTER COLUMN rightid SET WITH DEFAULT NULL
/
REORG TABLE rights
/
ALTER TABLE rights ALTER COLUMN groupid SET WITH DEFAULT NULL
/
REORG TABLE rights
/
ALTER TABLE rights ALTER COLUMN id SET NOT NULL
/
REORG TABLE rights
/
DELETE FROM rights WHERE NOT groupid IN (SELECT usrgrpid FROM usrgrp)
/
DELETE FROM rights WHERE NOT id IN (SELECT groupid FROM groups)
/
ALTER TABLE rights ADD CONSTRAINT c_rights_1 FOREIGN KEY (groupid) REFERENCES usrgrp (usrgrpid) ON DELETE CASCADE
/
ALTER TABLE rights ADD CONSTRAINT c_rights_2 FOREIGN KEY (id) REFERENCES groups (groupid) ON DELETE CASCADE
/
