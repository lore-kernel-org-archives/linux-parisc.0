Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id CCBE94829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 16:34:46 -0700 (MST)
Date: Tue, 18 Mar 2003 15:33:51 -0800
From: Randolph Chung <tausq@debian.org>
To: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
Cc: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 64 bit userspace
Message-ID: <20030318233351.GW26139@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <9A0482A7BD2506488AD9417C93F3714F01F2EB00@xsp01.brazil.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9A0482A7BD2506488AD9417C93F3714F01F2EB00@xsp01.brazil.hp.com>
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

> 	I would to know, what be missing to finish 64 bit userspace to we
> run 64 bit applications?
> 	If someone could enumerate the missing items and where we could
> access this development source, maybe I can give some help in this
> development.

Carlos might have a better list somewhere, but off the top of my head:

- binutils needs a lot of work for 64-bit palinux. It barely works for 
  building 64-bit kernels
- gcc's hppa64-linux target should be in decent shape in general, 
  although right now it cannot bootstrap itself (for 3.2 at least,
  not sure about 3.3... I have one patch from Dave to test)
- kernel assumes userspace is 32-bit in several places (e.g. syscalls,
  signals, ..) these need to be cleaned up
- there is no glibc support for hppa64-linux, this needs to be written
- there is no gdb support for hppa64-linux, this needs to be written

i'm sure there are more, but you get the idea -- in general nothing is
done yet and this will need a LOT of work; meanwhile we still have lots
to do for kernel and 32-bit userspace. If you have the time, and want to
hack on userspace stuff I can give you a list of interesting projects :)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
