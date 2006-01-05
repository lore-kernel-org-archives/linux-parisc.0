From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] finaly kill(1,
	25) was the init pause() pb on some systems but not all.
Date: Thu, 5 Jan 2006 07:46:32 -0700
Message-ID: <20060105144632.GS19769@parisc-linux.org>
References: <ISMIEZ$9134EE9181BF9A8CC866F8D5EBABBF59@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <ISMIEZ$9134EE9181BF9A8CC866F8D5EBABBF59@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jan 05, 2006 at 03:18:35PM +0100, Joel Soete wrote:
> This very small test case reproduce it:
> #include <stdio.h>
> #include <errno.h>
> #include <sys/types.h>
> #include <dirent.h>
> #include <ctype.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <signal.h>
> 
> int main(int argc, char **argv)
> {
>     int retdir=0;
>     retdir = kill (1, 25);
>     printf("Kill (1, 25) : %d\n", retdir);
>     printf("errno : %d\n", errno);
> }

Run as root?

> ====<>====
> 
> mmm that said, I am curious to know why '25' is coded like this (and not e.g.
> symbolic name)?

Probably because 25 is XFSZ on everything except MIPS and PA.

> Finaly: a kernel pb, a libc pb or chkrootkit bug?

Definitely the latter.  Whether it's a former, I don't know.  Can you
do it on x86 by sending init a TSTP?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
