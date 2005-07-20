From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Machine hanging during high-traffic NFS
Date: Wed, 20 Jul 2005 10:40:58 -0600
Message-ID: <20050720164058.GA3681@colo.lackof.org>
References: <42DD6A7F.8090706@excelcia.org>
	<20050720010425.GC24060@roadwarrior.mcmartin.ca>
	<42DDF65E.7010605@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org
To: Kurt Fitzner <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42DDF65E.7010605@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jul 20, 2005 at 12:59:42AM -0600, Kurt Fitzner wrote:
> I apologize - I had not seen that page before.  I should have done more
> research myself before reporting the issue.

FAQ has a reference to it. But thanks for reporting the bug.

> There is no console output prior to the hang, and no kernel fault to
> obtain the IAOQ/IASQ information from.  I did perform a TOC.  The data
> from that is below.
> 
> If there is any further information that might help, please let me know.

thanks - the key bit to start with is GR02 and IOAQ :

GR02 0x101e3910 nfs_mark_request_dirty+24
IOAQ 0x1010c1b0 intr_restore+11c

Sounds like either an interrupt storm from the card or a deadlock
in nfs code. Unfortunately TOC doesn't provide more stack trace
informaion. And I'm not able to chase NFS issues at the moment.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
