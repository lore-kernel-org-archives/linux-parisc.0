From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] NCR_700 problems on 715/64 with 2.6.11-rc4-pa1
Date: Sat, 19 Feb 2005 16:40:07 +0000
Message-ID: <20050219164007.GC455@parcelfarce.linux.theplanet.co.uk>
References: <200502191234.30310.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 James.Bottomley@HansenPartnership.com
To: Helge Deller <deller@gmx.de>
Return-Path: <willy@www.linux.org.uk>
In-Reply-To: <200502191234.30310.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Feb 19, 2005 at 12:34:30PM +0100, Helge Deller wrote:
> I get random messages from the 53c700 scsi driver (see below). 
> Any ideas ?
> _raw_foo() called with bad address 0xf0106121
> Backtrace:
>  [<10104ce4>] __raw_bad_addr+0x64/0x70
>  [<1028edd8>] NCR_700_start_command+0x3e8/0x78c

Yup.  This is a missing ioremap() in the 53c700 driver.  I'll have a
quick look, see if it's easily fixable (should be).  If the dmesg noise
annoys you, you can just turn off CONFIG_DEBUG_IOREMAP, but thanks for
reporting it -- it's an important step towards turning on HPPA_IOREMAP ...

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
