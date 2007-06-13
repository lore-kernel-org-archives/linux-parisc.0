From: Julian Stecklina <der_julian@web.de>
Subject: [parisc-linux] Status of parport driver in 2.6.20.1
Date: Wed, 13 Jun 2007 02:15:02 +0200
Message-ID: <466F3706.3020907__43784.065944101$1416624391$gmane$org@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
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

Hello,

I am running a 2.6.20.1 kernel on a C3600 workstation and want to hook 
up a printer to the parallel port. But modprobe'ing parport-pc or 
parport-serial gives me:

Kernel panic - not syncing: High Priority Machine Check (HPMC)

(This is using a serial line, no clue where the backtrace went...)

What is the current status of the parport driver on C3600 systems? Is 
this supposed to work? If so I am happy to provide a more thorough bug 
report.

Regards,
Julian
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
