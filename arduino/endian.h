#ifndef _ENDIAN_H
#define _ENDIAN_H

// arduinos are little endian.

#define htole32(v) v
#define le32toh(v) v
#define htole16(v) v
#define le16toh(v) v

#endif
