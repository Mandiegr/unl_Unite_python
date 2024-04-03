CREATE TABLE events (
  id VARCHAR(255) NOT NULL PRIMARY KEY, 
  title TEXT NOT NULL,
  details TEXT,
  slug VARCHAR(255) NOT NULL,  
  maximum_attendees INT NOT NULL  
);

CREATE TABLE attendees (
  id VARCHAR(255) NOT NULL PRIMARY KEY,  
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  event_id VARCHAR(255) NOT NULL,  
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT attendees_event_id_fkey FOREIGN KEY (event_id) REFERENCES events (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE check_ins (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  attendeeId VARCHAR(255) NOT NULL,  
  CONSTRAINT check_ins_attendeeId_fkey FOREIGN KEY (attendeeId) REFERENCES attendees (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE UNIQUE INDEX events_slug_unique ON events(slug);  
CREATE UNIQUE INDEX attendees_event_id_email_unique ON attendees(event_id, email);  
CREATE UNIQUE INDEX check_ins_attendeeId_unique ON check_ins(attendeeId);  
