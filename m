Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 13 Aug 2003 15:32:04 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
Message-ID: <20030813213204.GA26014@dsl2.external.hp.com>
References: <20030811043457.GA5653@dsl2.external.hp.com> <20030813175340.GF18794@dsl2.external.hp.com> <1060805514.2011.1.camel@fuzzy>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1060805514.2011.1.camel@fuzzy>
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

On Wed, Aug 13, 2003 at 03:11:42PM -0500, James Bottomley wrote:
> Hmm, it looks like you still have the libXt problem.  Are you sure you
> installed the newly compiled one?

I did...but you are definitely asking the right qustion.
I didn't see:
grundler@debian:~$ ls -l /usr/X11R6/lib/libXt.so*
lrwxrwxrwx    1 root     root           10 Jul 10 11:13 /usr/X11R6/lib/libXt.so -> libXt.so.6
lrwxrwxrwx    1 root     root           17 Aug 12 10:29 /usr/X11R6/lib/libXt.so.6 -> libXt.so.6.0-orig
-rw-r--r--    1 root     root       402072 Aug 11 19:55 /usr/X11R6/lib/libXt.so.6.0
-rw-r--r--    1 root     root       397408 Feb 25 21:57 /usr/X11R6/lib/libXt.so.6.0-orig

deleting the -orig file(s!) and fixing up the symlink(s) got xpdf
working again.  Yeah!
I found 6 or 7 X11/libs had been redirected to the -orig files.

Thanks for asking the right stupid question....and I'll have
to take the blame for leaving -orig files laying around.
Randolph observed ldconfig will fixup the links if something
"newer" (based on filename) is available. And "man ldconfig"
talks about how that works. *sigh*

Besides the /lib and /usr/lib directories (default), ldconfig
also looks at:
grundler <525>cat /etc/ld.so.conf 
/usr/X11R6/lib
grundler <526>


if I can just figure out what's botching the colors for xchat2 now...

thanks,
grant
