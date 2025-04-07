#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    // Open connection to syslog using LOG_USER facility
    openlog("writefile_utility", LOG_PID, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Error: Two arguments required - <writefile> <writestr>");
        //fprintf(stderr, "Error: Two arguments required - <writefile> <writestr>\n");
        closelog();
        return 1;
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    FILE *fp = fopen(writefile, "w");
    if (fp == NULL) {
        syslog(LOG_ERR, "Error: Could not create or write to the file %s", writefile);
        //fprintf(stderr, "Error: Could not create or write to the file %s\n", writefile);
        closelog();
        return 1;
    }

    if (fprintf(fp, "%s", writestr) < 0) {
        syslog(LOG_ERR, "Error: Failed to write to the file %s", writefile);
        //fprintf(stderr, "Error: Failed to write to the file %s\n", writefile);
        fclose(fp);
        closelog();
        return 1;
    }

    fclose(fp);

    // Log the successful write
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
    //printf("Successfully wrote to %s\n", writefile);

    // Close connection to syslog
    closelog();
    return 0;
}
