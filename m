From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [id]cache meaning? [Was: [parisc-linux] 2.6.10-rc1-pa11 profile
	data]
Date: Mon, 29 Nov 2004 02:00:42 +0000
Message-ID: <20041129020042.GQ29035@parcelfarce.linux.theplanet.co.uk>
References: <20041111075431.GB9768@colo.lackof.org>
	<41AA3CB6.5070407@tiscali.be>
	<20041128211303.GP29035@parcelfarce.linux.theplanet.co.uk>
	<200411281914.14917.mszick@wolfbutter.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Michael S. Zick" <mszick@wolfbutter.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200411281914.14917.mszick@wolfbutter.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Nov 28, 2004 at 07:14:14PM -0600, Michael S. Zick wrote:
> Question:
> Is the:
> > > flush_kernel_icache_page(page_address(page)); 
> (or the hardware that receives the command)
> 
> smart enough to just mark the page 'invalid' or is it
> actually an 'absolute update external storage'?

The I-cache is, by definition, read-only, so there's nothing to update
main memory with.

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
