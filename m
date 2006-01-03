From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] J2240 - Almost there....
Date: Mon, 2 Jan 2006 19:01:16 -0700
Message-ID: <20060103020116.GI19769@parisc-linux.org>
References: <7d01f9f00601010615v54117490o9a575fd279244524@mail.gmail.com>
	<000401c61003$cea58c60$3401a8c0@POGO>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 'Thibaut VARENE' <T-Bone@parisc-linux.org>
To: "Craig D. Lansing" <clansing@charter.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <000401c61003$cea58c60$3401a8c0@POGO>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 02, 2006 at 08:19:55PM -0500, Craig D. Lansing wrote:
> f1600000-f3ffffff : GSC Bus [10/]
>   f1604000-f1604fff : Cujo
>   f1607800-f1607807 : serial
>   f1800000-f1ffffff : Cujo LMMIO 0
> f4000000-f5ffffff : GSC Bus [8/]
> f6000000-f7ffffff : GSC Bus [10/]
>   f6000000-f7ffffff : Cujo LMMIO 1
> f8000000-fff7ffff : GSC Bus [8/]
>   fc000000-fc000fff : Cujo
>   fc004000-fc004fff : Dino [8/4]
>   fc800000-fcffffff : Dino [8/4] LMMIO 0
>   fd800000-fdffffff : Cujo LMMIO 0
[...]
> Found devices:
> 1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0xf, 0x580, 0x0000b } 2.
> unknown device at 0xfc000000 [8/0] { 13, 0x3, 0x05d, 0x0000a },  additional
> a
> ddresses: 0xfd800000
[...]
> Cujo version unknown found at 0xfc000000 Dino [8/4] version 3.1 found at
> 0xfc004000 Cujo version 2.0 found at 0xf1604000 Enabling Cujo 2.0 bug
> workaround SCSI subsystem initialized TC classifier action (bugs to

Fixed both of these problems (Dino reported as Cujo and first Cujo
reported as unknown)

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
