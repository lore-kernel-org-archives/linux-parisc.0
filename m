From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] 2.6.11 kernel trouble
Date: Wed, 9 Mar 2005 15:52:07 +0000
Message-ID: <20050309155207.GA21986@parcelfarce.linux.theplanet.co.uk>
References: <BAY24-F182B0FC44FD328F86929F1D8510@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Jan Prunk <janprunk@hotmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <BAY24-F182B0FC44FD328F86929F1D8510@phx.gbl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Mar 09, 2005 at 11:12:51AM +0000, Jan Prunk wrote:
> I managed to install 2.6.11-pa2-defconfig from parisc CVS, but i noticed 
> that default config doesnt have IPv6 enabled?
> It boots well. But I need IPv6 support, so I compiled my own kernel. It 
> would be really good in the future if IPv6 was enabled in defconfigs, so 
> that I could easily download and update the kernels.
> 
> I downloaded 2.6.11-pa2 kernel from parisc CVS, but it gave me following 
> problems when compileing:
> CC      init/version.o
>  LD      init/built-in.o
>  LD      .tmp_vmlinux1
> drivers/built-in.o(.init.text+0x2f40): In function `sti_select_fbfont':
> : undefined reference to `find_font'
> drivers/built-in.o(.init.text+0x3040): In function `sti_select_fbfont':
> : undefined reference to `get_default_font'

Ah, figured it out.  We just needed to include font.o when we have
STI_CONSOLE selected but not FRAMEBUFFER_CONSOLE.  If you do a cvs update,
you should be able to build with your current config.

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
