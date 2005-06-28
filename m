From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: install failure model 9000/879/K260
Date: Tue, 28 Jun 2005 12:19:26 -0600
Message-ID: <20050628181926.GA2543__37493.4571017095$1416623823$gmane$org@colo.lackof.org>
References: <20050628093912.GA20475@paradigm.rfc822.org>
	<200506281208.j5SC8uru014096@arbas.nms.ulrich-teichert.org>
	<20050628123308.GA22276@paradigm.rfc822.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Florian Lohoff <flo@rfc822.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050628123308.GA22276@paradigm.rfc822.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jun 28, 2005 at 02:33:08PM +0200, Florian Lohoff wrote:
> > Sounds like a known bug - try to set the kernel option ramdisk_size=32768.
> > You seem to have enough RAM on your box for a bigger ramdisk as well.....
> 
> Yep - fixes this problem - Later on it dies again with a Kernel fault
> and without stack trace :(

Florian,
Can you capture and post the complete console output from power on
until crash?

Our "how to report kernel bugs" FAQ is here:
   http://www.parisc-linux.org/faq/kernelbug-howto.html

In general, the parisc-linux kernels have been known to boot
on K-class machines. I think Franke Benke might be able to help
you out...ISTR he has a K-class to play with as well.

grant

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
