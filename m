From: "Kai Holthaus" <kmh@sonic.net>
Subject: Re: [parisc-linux] A500: 2.4.18 64bit SMP Kernel Crash
Date: Tue, 19 Apr 2005 14:06:15 -0700 (PDT)
Message-ID: <13566.64.142.78.25.1113944775.squirrel@webmail.sonic.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: parisc-linux@lists.parisc-linux.org
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

> Can you try a prebuilt a500 kernel? Something from
> http://cvs.parisc-linux.org/download/linux-2.6/

Thanks for your reply - I did try the 64smp flavor of the 2.4.22 kernel on
cvs.p-l.org, and that worked.

> If you want to build it from source, I would suggest that you:
> - upgrade to "testing" from woody
> - install gcc-3.3-hppa64 and binutils-hppa64 (from Debian, not
>  from unofficial-debs)
> - Get the sources from

If at all possible, I'd like the system to stay on woody, since it's going
to be a server. I did install the gcc and binutils testing Debian
packages, and tried to compile the 2.6.11-pa2 kernel from cvs.p-l.org, and
got that to work with 64-bit and smp as well.

So, thanks again for the tips!

   Kai Holthaus
   kmh.AT.sonic.net

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
