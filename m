From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] remove hil_kbd.c?
Date: Wed, 16 Mar 2005 14:39:46 +0000
Message-ID: <20050316143946.GN21986@parcelfarce.linux.theplanet.co.uk>
References: <20050316045541.GA10031@colo.lackof.org>
	<20050316133722.GM21986@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050316133722.GM21986@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Mar 16, 2005 at 01:37:22PM +0000, Matthew Wilcox wrote:
> Just the opposite way round.  hilkbd.c is the one I ported from the m68k
> guys back in 1999.  hil_kbd.c is the shiny new input-layer one that Brian
> Julin wrote from scratch.  Check the Kconfig/Makefile.

I forgot to say that it is, of course, desirable that we eliminate the
earlier driver.  It doesn't support HIL mice or other HIL devices.
I'd really like to see some of the problems with the newer driver fixed
though:

 - Apparent consumption of 70%+ CPU
 - Booting without a HIL device attached leads to hundreds of messages
   about requests already being queued.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
