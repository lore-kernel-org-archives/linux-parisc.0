From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Linux on a HP 9000/800/N4000-36
Date: Sat, 04 Jun 2005 09:11:23 +0000
Message-ID: <42A1703B.3090206@tiscali.be>
References: <42A0B12D.8070602@xtech.com.ar>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: Roel <Rule@freegates.be>,
 Peter Van Loock <pvl@maxon.be>,
 parisc-linux@lists.parisc-linux.org
To: Daniel Coletti <dcoletti@xtech.com.ar>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42A0B12D.8070602@xtech.com.ar>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Daniel Coletti wrote:
> Hi,
>     I tried to install Debian on a HP9000/800/N4000-36 and the kernel 
> doesn't work. As I can read in this[0] page, somebody did make it work 
> but on a -55 model (not -36 like the one I tried with).
> http://hwdb.parisc-linux.org/view.php?type=machine&name=N4000-55
> 
Afaik, the only diff is the cpu clock?

> Since I used the HP console I don't have the full output, but the 
> startup seams to work fine (with the default kernel params) until it 
> starts writing:
> Kernel bug at lba_pci.c:1285!
> Kernel bug at lba_pci.c:1250!
> lba range[2]: ignoring GMMIO (0x-a-lot-of-hexa-numbers)
> [....]
> WARNING! Stack pointer and cr30 do not correspond
> Dumping virtual address stack instead
> Dumping from 0x000000005fd40000 to 0x000000005fa44b00
> 
> and it prints lots and lots of hexa numbers and sais things like "PSW: 
> NNNNN Not tainted nnnnNNNnnNN"
> 
> I tried with debian-woody official ISO (downloaded from debian), is 
> there something special that I have to do with the HP N-class?
As far as remember, woody comes with kernel 2.4?
Unfortunately, iirc the pb you encountered is a well known _smp_ kernel bug never fixed in 2.4 but well it 2.6 :-)

> Is there another kernel I should try out?> 
First try to install a up kernel (for the A, L and N Class is must be a 64bit).
Then you would be able to upgrade to sarge and install a 2.6 kernel (may be try first a up kernel then try the smp one)

Or you could reinstall your system with a recent netinstall iso cd:
<http://cdimage.debian.org/pub/cdimage-testing/sarge_d-i/hppa/>

Hth,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
