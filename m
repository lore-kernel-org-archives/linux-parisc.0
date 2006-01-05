From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] finaly kill(1, 25) was the init pause() pb on some
	systems but not all.
Date: Thu,  5 Jan 2006 17:21:43 +0100
Message-ID: <ISMO47$84F6A96E04ED5DC958A06D88419F6D3C@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "matthew" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Thu, Jan 05, 2006 at 03:18:35PM +0100, Joel Soete wrote:
> > This very small test case reproduce it:
> > #include <stdio.h>
> > #include <errno.h>
> > #include <sys/types.h>
> > #include <dirent.h>
> > #include <ctype.h>
> > #include <stdlib.h>
> > #include <unistd.h>
> > #include <signal.h>
> > 
> > int main(int argc, char **argv)
> > {
> >     int retdir=3D0;
> >     retdir =3D kill (1, 25);
> >     printf("Kill (1, 25) : %d\n", retdir);
> >     printf("errno : %d\n", errno);
> > }
> 
> Run as root?
> 
Yes ;-)

(as common user:
$ ./TstK
Kill (1, 25) : -1
errno : 1

> > =3D=3D=3D=3D<>=3D=3D=3D=3D
> > 
> > mmm that said, I am curious to know why '25' is coded like this (and =
not e.g.
> > symbolic name)?
> 
> Probably because 25 is XFSZ on everything except MIPS and PA.
> 
> > Finaly: a kernel pb, a libc pb or chkrootkit bug?
> 
> Definitely the latter.  Whether it's a former, I don't know.  Can you
> do it on x86 by sending init a TSTP?
> 
> 
Well, writen the foo.c like:
int main(int argc, char **argv)
{
    int retdir=3D0;
    retdir =3D kill (1, SIGTSTP);
    printf("Kill (1, SIGTSTP) : %d\n", retdir);
    printf("errno : %d\n", errno);
}

(i.e. on i386: #define SIGTSTP         20      /* Keyboard stop (POSIX). =
 */)

has the same effect on a i386, though:
top - 17:03:15 up 2 days,  1:34,  7 users,  load average: 0.02, 0.05, 0.0=
1
Tasks:  72 total,   1 running,  71 sleeping,   0 stopped,   0 zombie
Cpu(s):  3.0% us,  0.3% sy,  0.0% ni, 95.4% id,  0.0% wa,  0.3% hi,  1.0%=
 si
Mem:    125892k total,   121868k used,     4024k free,    11520k buffers
Swap:   257032k total,    38368k used,   218664k free,    52244k cached
Change delay from 3.0 to: 
  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  WCHAN     CO=
MMAND
                                                    
 3058 jso       15   0  118m  42m  12m S  3.3 34.7  26:29.05 stext    
mozilla-bin                                                  
 8883 root      16   0  2248 1088  840 R  0.7  0.9   0:03.68 stext     to=
p   
                                                      
    1 root      16   0  1924  604  552 S  0.0  0.5   0:00.42 pause     in=
it  
                                                      

That said, I also thought that could be an init pb:
i read in ./parisc/kernel/signal.c:
/* 
 * Note that 'init' is a special process: it doesn't get signals it doesn=
't
 * want to handle.
[...]

but what are the signal that init want to handle?

Btw: could you explain me why is it foreseen that it want to handle SIGTS=
TP
(what ever is real value is) and not ignore it as I basicaly thought?

Thanks,
    Joel

PS: I will report pb asap to chkrootkit.
=0A=0A-------------------------------------------------------=0ANOTE! My =
email address is changing to ... @scarlet.be=0APlease make the necessary =
changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
