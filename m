From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] glibc-2.6 status
Date: Mon, 30 Jul 2007 09:50:17 -0700
Message-ID: <5b2e36650707300950k1552c56es93cbb61aeeb06521__26296.0856118754$1416624424$gmane$org@mail.gmail.com>
References: <200707281608.33638.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8
Cc: parisc-linux@lists.parisc-linux.org
To: "Mike Frysinger" <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200707281608.33638.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 28/07/07, Mike Frysinger <vapier@gentoo.org> wrote:
> is it worth trying to make vanilla glibc-2.6 work ?  once i fixed elf/elf.h to
> have all of the new PARISC defines, it cross-compiled fine for me ... or is
> there more patches needed for runtime ?
> -mike

Ubuntu and Debian are now building glibc-2.6 for hppa, so in the event
of trouble, it's probably worth fishing through there for diffs.  On
Ubuntu hppa, I've got the same set of failures that Carlos reported.

(I'm travelling atm, sorry for any slow responses)

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
