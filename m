From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] 712/100 keyboard not working in 2.6.6-pa2?
Date: Tue, 18 May 2004 09:06:29 -0400
Message-ID: <20040518130629.GE27929@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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


pa,

I just rebooted my 712/100 with a 2.6.6-pa2 kernel and my keyboard
(PS/2) no longer works The keyboard works in firmware, as I have to
issue "bo lan" to boot my kernel. The keyboard doesn't work in both the
console and X.

Anyone running a 712/100 in 2.6.6 without issues?

Maybe I should just purge my .config and see what happens.

*shrug*

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
