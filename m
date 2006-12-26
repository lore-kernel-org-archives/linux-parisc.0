From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: [parisc-linux] Feisty and HPPA
Date: Tue, 26 Dec 2006 10:50:02 -0500
Message-ID: <5b2e36650612260750s68a4a19vd83090f5dbe7cff8__2827.5373661474$1416624240$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 adam.conrad@ubuntu.com,
 "Carlos O'Donell" <carlos@systemhalted.org>
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

For those interested in playing along, I'm putting the .deb's that I'm
building up at:

http://people.ubuntu.com/~jbailey/snapshot/hppa-feisty/

It's apt'able.  You probably also want to have the usual Dapper and
Feisty repos in your sources.list, since older binaries and arch-all
packages can come from there.  Sources are all the pristine source
>from Feisty.

In particular, this features NPTL and TLS, although with 2.6.20-rc2
I'm still seeing the glibc failures that Carlos reported on September
6th[0], not the much-reduced set he reported on September 13th[1].

[0] http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/030146.html
[1] http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/030197.html

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
