Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (ottawa.linuxcare.com [216.208.98.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2436C4A19
	for <parisc-linux@parisc-linux.org>; Wed, 14 Mar 2001 13:08:30 -0700 (MST)
Received: (from pjlahaie@localhost)
	by localhost.localdomain (8.11.0/8.11.0) id f2EK9PU14789
	for parisc-linux@parisc-linux.org; Wed, 14 Mar 2001 15:09:25 -0500
Date: Wed, 14 Mar 2001 15:09:25 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
To: parisc-linux@parisc-linux.org
Message-ID: <20010314150925.E13965@achilles.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Subject: [parisc-linux] popen/pclose problem
List-ID: <linux-parisc.vger.kernel.org>

--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There seems to be a bug with popen/pclose on parisc.  In dbootstrap,
the Debian bootstrap install program, there is a function that will
run an application with its output redirected to syslog with the use
of popen/pclose.  In this application, pclose always returns -1 which
is (according to the manpage):

"The  pclose function returns -1 if wait4 returns an error, or some other
error is detected."

The function with the error is execlog in utilities/dbootstrap/util.c.

Interestingly, if I take out that function and wrap a main around it,
pclose returns the right values.  Here follows the standalone program
I wrote using the function.

--- cut here ---
#include <stdio.h>
#include <syslog.h>
#define MAXLINE 1024
int  execlog (const char *incmd, int priority)
{
  FILE *output;
  char line[MAXLINE];
  char cmd[strlen(incmd) + 6];
  strcpy(cmd, incmd);

    openlog("sysrun", LOG_PID, LOG_USER);

  /* FIXME: this can cause the shell command if there's redirection
            already in the passed string */
  strcat(cmd, " 2>&1");
  output = popen(cmd, "r");
  while (fgets(line, MAXLINE, output) != NULL ) {
    syslog(priority, line);
  }
  closelog();
  return(pclose(output));
}

int main(int argc,char **argv)
{
    int ret;
    if( argc < 2 )
    {
        fprintf( stderr, "Missing arguments.\n" );
        exit(1);
    }

    ret = execlog( argv[1], LOG_INFO);
    if( ret != 0 )
    {
        fprintf( stderr, "Bad return value %d\n", ret );
        return ret;
    }
    return 0;
}
--- cut here ---

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6r8/18ggPQthPCzcRAt0tAKCjGpvXAwOkj56emApAm9wcHwVDjgCfShFb
pOwaWU6by506Cm7hbof6pCQ=
=7Zvw
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--
