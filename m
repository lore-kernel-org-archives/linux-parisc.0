From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: *lcul and memory granularity question[Was: [parisc-linux]
	2.6.10-rc1-pa11 profile data]
Date: Fri, 3 Dec 2004 15:13:27 +0000
Message-ID: <20041203151327.GG29370@parcelfarce.linux.theplanet.co.uk>
References: <20041111075431.GB9768@colo.lackof.org>
	<20041111081154.GR15714@tausq.org> <41B07F91.9000000@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41B07F91.9000000@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Dec 03, 2004 at 03:00:33PM +0000, Joel Soete wrote:
> >- *lclu* can be rewritten to do better than 1-byte at a time
> 
> I have an additional question about parisc alignment and this remark:
> a char type var is 1byte align; ... but what's about a 3, 5, 7 and more 
> bytes struct size?

Don't think in terms of structs, think in terms of an arbitrary array of
bytes.  You can't assume anything about the alignment of lclu or the size.
In particular, you can't write more than the requested number of bytes.

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
