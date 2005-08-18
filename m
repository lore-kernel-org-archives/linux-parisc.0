From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Fri, 19 Aug 2005 07:49:44 +0800
Message-ID: <43051E98.7080306@tausq.org>
References: <ILFDUV$F78A20A99DD29674BBE529F42F203D92@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <ILFDUV$F78A20A99DD29674BBE529F42F203D92@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I also install the latest gcc-4.0-4.0.1-5 on my unstable b2k install to
> rebuild the same 32bit kernel (2.6.13-rc6-pa2 cvs 20050817) but saving libc6
> 2.3.2.ds1-22 (excepted this the 2 systems are debian unstable update at the
> same level this morning).
> Well the system reboot fine but the same test as describe above make again the
> system hang after only 45min of test ;_(

does the system respond to sysrq when it hangs? if so it may be useful 
to look at it with kdb.

does it always hang in internal_add_timer?

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
