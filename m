From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: Re: [parisc-linux] Debian etch rc1 & daily build install fail on C160
Date: Thu, 30 Nov 2006 10:38:29 -0700
Message-ID: <456F1715.5080305__4004.01247102327$1416624225$gmane$org@excelcia.org>
References: <4562C898.2090605@excelcia.org>
	<200611211348.20682.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <200611211348.20682.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I've tried everything I can think of, but can't get the system to boot.
 I finally got smart and checked /proc/modules after a failed boot (at
the initramfs prompt) and found that only an ide driver was loaded.  Not
exactly what a C160 needs.

So, it doesn't look like a device ordering problem - it's a lack of
device problem.  Other than compiling a kernel to hard-code the correct
devices in, does anyone have suggestions as to how to get the right
drivers to auto-load?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
