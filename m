From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: back to glibc-2.3.3 & gcc-3.4.1 pb
Date: Mon, 6 Sep 2004 18:02:52 -0400
Message-ID: <20040906220252.GP15721@baldric.uwo.ca>
References: <413775C8.3060108@tiscali.be>
	<20040903154019.GR32474@baldric.uwo.ca>
	<4138B043.2020009@tiscali.be>
	<20040904162953.GE32474@baldric.uwo.ca>
	<413AE748.3030207@tiscali.be> <413AFB1F.7010407@tiscali.be>
	<20040906200321.GO15721@baldric.uwo.ca>
	<413CC811.4020401@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <413CC811.4020401@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Sep 06, 2004 at 08:26:57PM +0000, Joel Soete wrote:
> "atime has not changed"
> 
> mmm may be that's logical:
> /dev/sda3		/		xfs		noatime		 
> 

Yes. That is the reason for the failure.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
