Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B0E34829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 23:53:11 -0700 (MST)
Date: Wed, 19 Mar 2003 07:53:00 +0100
Message-ID: <3E68A12A0000337E@ocpmta3.freegates.net>
In-Reply-To: <20030319062343.GG28363@systemhalted>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] squid pb with glibc-2.3.1 and pthread (pb reproduced now)
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="========/3E68A12A0000337E/mail.tiscali.be"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--========/3E68A12A0000337E/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit


>
>> So it doesn't yet help here. Never the less I think that I reach to produce
>> enough simple material which Carlos could analyse (in its time) :)
>
>If you send me a test case I can look at it. I don't even see why -l
>pthread would break the previous code :)
>

Don't even more but it is a rare case where I encounter mallopt usage?

Anyway here it is:

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

/* getpid(), geteuid()  */
#include <sys/types.h>
#include <unistd.h>

/* setgroups() */
#include <grp.h>

/* mkdir() */
#include <sys/stat.h>
#define MAXPATHLEN 256

/* waitpid() */
#include <sys/wait.h>

/* mallopt() */
#include <malloc.h>

#define SQUID_MAXFD 4096

/* autoconf.h */
/* Define if you have the mallopt function.  */
#define HAVE_MALLOPT 1

/* dlmalloc.c */
#define M_GRAIN   3    /* UNUSED in this malloc */
#define M_MXFAST  1    /* UNUSED in this malloc */

int Squid_MaxFD;		/* SQUID_MAXFD */

FILE *debug_log = NULL;

int
main(int argc, char **argv)
{
    int errcount = 0;
    mode_t oldmask;

    debug_log = stderr;
    if (FD_SETSIZE < Squid_MaxFD)
	Squid_MaxFD = FD_SETSIZE;

    fprintf(stderr, "nb_err: %d\n", errcount);
    /* call mallopt() before anything else */

#ifdef HAVE_MALLOPT
    fprintf(stderr, "  HAVE_MALLOPT \n");
#ifdef M_GRAIN
    /* Round up all sizes to a multiple of this */
    fprintf(stderr, " M_GRAIN seti: %d\n", M_GRAIN);
    mallopt(M_GRAIN, 16);
#endif
#ifdef M_MXFAST
    /* biggest size that is considered a small block */
    fprintf(stderr, " M_MXFAST seti: %d\n", M_MXFAST);
    mallopt(M_MXFAST, 256);
#endif
#ifdef M_NBLKS
    /* allocate this many small blocks at once */
    fprintf(stderr, " M_NBLKS set: %d\n", M_NBLKS);
    mallopt(M_NLBLKS, 32);
#endif
#endif /* HAVE_MALLOPT */

/*
    oldmask = umask(S_IRWXO);
 */

    return 0;
}

compile it with cmd:
gcc -o foo -l pthread foo.c

(the simple gcc -o foo foo.c do not present the pb;
neither gcc -static -o foo -l pthread foo.c [previously it makes a segv])

Thanks for your attention,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be



--========/3E68A12A0000337E/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="foo.c"

Ci8qCiAqICRJZDogbWFpbi5jLHYgMS4zNDUuMi40IDIwMDIvMDcvMTQgMTc6MjA6NDkgaG5vIEV4
cCAkCiAqCiAqIERFQlVHOiBzZWN0aW9uIDEgICAgIFN0YXJ0dXAgYW5kIE1haW4gTG9vcAogKiBB
VVRIT1I6IEhhcnZlc3QgRGVyaXZlZAogKgogKiBTUVVJRCBXZWIgUHJveHkgQ2FjaGUgICAgICAg
ICAgaHR0cDovL3d3dy5zcXVpZC1jYWNoZS5vcmcvCiAqIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICoKICogIFNxdWlkIGlzIHRoZSBy
ZXN1bHQgb2YgZWZmb3J0cyBieSBudW1lcm91cyBpbmRpdmlkdWFscyBmcm9tCiAqICB0aGUgSW50
ZXJuZXQgY29tbXVuaXR5OyBzZWUgdGhlIENPTlRSSUJVVE9SUyBmaWxlIGZvciBmdWxsCiAqICBk
ZXRhaWxzLiAgIE1hbnkgb3JnYW5pemF0aW9ucyBoYXZlIHByb3ZpZGVkIHN1cHBvcnQgZm9yIFNx
dWlkJ3MKICogIGRldmVsb3BtZW50OyBzZWUgdGhlIFNQT05TT1JTIGZpbGUgZm9yIGZ1bGwgZGV0
YWlscy4gIFNxdWlkIGlzCiAqICBDb3B5cmlnaHRlZCAoQykgMjAwMSBieSB0aGUgUmVnZW50cyBv
ZiB0aGUgVW5pdmVyc2l0eSBvZgogKiAgQ2FsaWZvcm5pYTsgc2VlIHRoZSBDT1BZUklHSFQgZmls
ZSBmb3IgZnVsbCBkZXRhaWxzLiAgU3F1aWQKICogIGluY29ycG9yYXRlcyBzb2Z0d2FyZSBkZXZl
bG9wZWQgYW5kL29yIGNvcHlyaWdodGVkIGJ5IG90aGVyCiAqICBzb3VyY2VzOyBzZWUgdGhlIENS
RURJVFMgZmlsZSBmb3IgZnVsbCBkZXRhaWxzLgogKgogKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUg
c29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICogIGl0IHVu
ZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlz
aGVkIGJ5CiAqICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAy
IG9mIHRoZSBMaWNlbnNlLCBvcgogKiAgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lv
bi4KICogIAogKiAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQg
aXQgd2lsbCBiZSB1c2VmdWwsCiAqICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQg
ZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgogKiAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5F
U1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQogKiAgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KICogIAogKiAgWW91IHNob3VsZCBoYXZlIHJl
Y2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKICogIGFsb25n
IHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCiAq
ICBGb3VuZGF0aW9uLCBJbmMuLCA1OSBUZW1wbGUgUGxhY2UsIFN1aXRlIDMzMCwgQm9zdG9uLCBN
QSAwMjExMSwgVVNBLgogKgogKi8KCi8qCiNpbmNsdWRlICJzcXVpZC5oIgogKi8KCiNpbmNsdWRl
IDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1
ZGUgPGVycm5vLmg+CgovKiBnZXRwaWQoKSwgZ2V0ZXVpZCgpICAqLwojaW5jbHVkZSA8c3lzL3R5
cGVzLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KCi8qIHNldGdyb3VwcygpICovCiNpbmNsdWRlIDxn
cnAuaD4KCi8qIG1rZGlyKCkgKi8KI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CiNkZWZpbmUgTUFYUEFU
SExFTiAyNTYKCi8qIHdhaXRwaWQoKSAqLwojaW5jbHVkZSA8c3lzL3dhaXQuaD4KCi8qIG1hbGxv
cHQoKSAqLwojaW5jbHVkZSA8bWFsbG9jLmg+CgojZGVmaW5lIFNRVUlEX01BWEZEIDQwOTYKCi8q
IGF1dG9jb25mLmggKi8KLyogRGVmaW5lIGlmIHlvdSBoYXZlIHRoZSBtYWxsb3B0IGZ1bmN0aW9u
LiAgKi8KI2RlZmluZSBIQVZFX01BTExPUFQgMQoKLyogZGxtYWxsb2MuYyAqLwojZGVmaW5lIE1f
R1JBSU4gICAzICAgIC8qIFVOVVNFRCBpbiB0aGlzIG1hbGxvYyAqLwojZGVmaW5lIE1fTVhGQVNU
ICAxICAgIC8qIFVOVVNFRCBpbiB0aGlzIG1hbGxvYyAqLwoKaW50IFNxdWlkX01heEZEOwkJLyog
U1FVSURfTUFYRkQgKi8KCkZJTEUgKmRlYnVnX2xvZyA9IE5VTEw7CgppbnQKbWFpbihpbnQgYXJn
YywgY2hhciAqKmFyZ3YpCnsKICAgIGludCBlcnJjb3VudCA9IDA7CiAgICBtb2RlX3Qgb2xkbWFz
azsKCiAgICBkZWJ1Z19sb2cgPSBzdGRlcnI7CiAgICBpZiAoRkRfU0VUU0laRSA8IFNxdWlkX01h
eEZEKQoJU3F1aWRfTWF4RkQgPSBGRF9TRVRTSVpFOwoKICAgIGZwcmludGYoc3RkZXJyLCAibmJf
ZXJyOiAlZFxuIiwgZXJyY291bnQpOwogICAgLyogY2FsbCBtYWxsb3B0KCkgYmVmb3JlIGFueXRo
aW5nIGVsc2UgKi8KCiNpZmRlZiBIQVZFX01BTExPUFQKICAgIGZwcmludGYoc3RkZXJyLCAiICBI
QVZFX01BTExPUFQgXG4iKTsKI2lmZGVmIE1fR1JBSU4KICAgIC8qIFJvdW5kIHVwIGFsbCBzaXpl
cyB0byBhIG11bHRpcGxlIG9mIHRoaXMgKi8KICAgIGZwcmludGYoc3RkZXJyLCAiIE1fR1JBSU4g
c2V0aTogJWRcbiIsIE1fR1JBSU4pOwogICAgbWFsbG9wdChNX0dSQUlOLCAxNik7CiNlbmRpZgoj
aWZkZWYgTV9NWEZBU1QKICAgIC8qIGJpZ2dlc3Qgc2l6ZSB0aGF0IGlzIGNvbnNpZGVyZWQgYSBz
bWFsbCBibG9jayAqLwogICAgZnByaW50ZihzdGRlcnIsICIgTV9NWEZBU1Qgc2V0aTogJWRcbiIs
IE1fTVhGQVNUKTsKICAgIG1hbGxvcHQoTV9NWEZBU1QsIDI1Nik7CiNlbmRpZgojaWZkZWYgTV9O
QkxLUwogICAgLyogYWxsb2NhdGUgdGhpcyBtYW55IHNtYWxsIGJsb2NrcyBhdCBvbmNlICovCiAg
ICBmcHJpbnRmKHN0ZGVyciwgIiBNX05CTEtTIHNldDogJWRcbiIsIE1fTkJMS1MpOwogICAgbWFs
bG9wdChNX05MQkxLUywgMzIpOwojZW5kaWYKI2VuZGlmIC8qIEhBVkVfTUFMTE9QVCAqLwoKLyoK
ICAgIG9sZG1hc2sgPSB1bWFzayhTX0lSV1hPKTsKICovCgogICAgcmV0dXJuIDA7Cn0KCg==

--========/3E68A12A0000337E/mail.tiscali.be--
