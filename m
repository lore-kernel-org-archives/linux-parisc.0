From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] 2.6.11-rc3-pa3 smp "Segmentation fault" but not up
Date: Sat, 15 Jan 2005 14:41:11 +0000
Message-ID: <20050115144111.GQ30982@parcelfarce.linux.theplanet.co.uk>
References: <41E92258.60006@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: List Parisc <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41E92258.60006@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jan 15, 2005 at 02:02:00PM +0000, Joel Soete wrote:
> With previous kernel it makes panic kernel hazardiously from 1 to more 200 
> occurences. With this 2.6.11-rc3-pa3 after about 49 runs some "Segmentation 
> fault" occures:
> make[3]: *** [drivers/pci/probe.o] Segmentation fault
> 
> for some child's shell (I attached dmesg because very long).
> 
> I so stop this loop to reboot with same kernel but up build and relaunch 
> the loop.
> After about 12h it already runs 80 times without any segmantation fault.
> 
> Any idea?

I suspect the new clear_user_page code.  Could you try backing that out
and rerunning your test?

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
