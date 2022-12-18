1,2 already exist, some fiexes


3. `folders`: This table could store information about each folder, such as its name and owner. Some columns you could include in this table are:
  - `id` (primary key): A unique identifier for each folder
  - `name`: The name of the folder
  - `ownerId`: A foreign key referencing the `id` column in the `users` table, indicating the user who owns the folder
  - `parentId`: A foreign key referencing the `id` column in the `folders` table, indicating the parent folder (if any) of the current folder
  - `createdAt`: The date and time the folder was created

4. `fileTags`: This table could store information about tags associated with each file. Some columns you could include in this table are:
  - `id` (primary key): A unique identifier for each tag
  - `fileId`: A foreign key referencing the `id` column in the `files` table, indicating the file to which the tag belongs
  - `tag`: The tag name
  - `createdAt`: The date and time the tag was created

5. `folderTags`: This table could store information about tags associated with each folder. Some columns you could include in this table are:
  - `id` (primary key): A unique identifier for each tag
  - `folderId`: A foreign key referencing the `id` column in the `folders` table, indicating the folder to which the tag belongs
  - `tag`: The tag name
  - `createdAt`: The date and time the tag was created

  
6. `filePermissions:` This table could store information about the permissions associated with each file, such as who has read, write, and execute access to the file. Some columns you could include in this table are:
  - `id` (primary key): A unique identifier for each permission
  - `fileId`: A foreign key referencing the id column in the files table, indicating the file to which the permission belongs
  - `userId`: A foreign key referencing the id column in the users table, indicating the user to whom the permission applies
  - `permission`: An enumerated type indicating the type of permission (e.g. READ, WRITE, EXECUTE)
  - `createdAt`: The date and time the permission was created

7. `folderPermissions`: This table could store information about the permissions associated with each folder, such as who has read, write, and execute access to the folder and its contents. Some columns you could include in this table are:
  - `id` (primary key): A unique identifier for each permission
  - `folderId`: A foreign key referencing the id column in the folders table, indicating the folder to which the permission belongs
  - `userId`: A foreign key referencing the id column in the users table, indicating the user to whom the permission applies
  - `permission`: An enumerated type indicating the type of permission (e.g. READ, WRITE, EXECUTE)
  - `createdAt`: The date and time the permission was created

8. activityLog: This table could store a log of all the actions taken by users on the system, such as creating, modifying, or deleting files and folders. Some columns you could include in this table are:
  - `id` (primary key): A unique identifier for each log entry
  - `userId`: A foreign key referencing the id column in the users table, indicating the user who performed the action
  - `action`: An enumerated type indicating the type of action (e.g. CREATE, MODIFY, DELETE)
  - `objectType`: An enumerated type indicating the type of object the action was performed on (e.g. FILE, FOLDER)
  - `objectId: A foreign key referencing the id column in the `files

NOTE: enum types u can change for e.g. permissionId and create new table for it
and create ralatations :)
