From: Matthew Wilcox <matthew@wil.cx>
Subject: Unknown device 0x0005f
Date: Tue, 4 Sep 2007 16:15:37 -0600
Message-ID: <20070904221537.GV14130__12737.8516750925$1416624432$gmane$org@parisc-linux.org>
References: <20070828215632.R6291@saddam.controlq.com> <200709042213.25542.deller@gmx.de> <20070904172254.Q31055@saddam.controlq.com> <200709042344.30215.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: rob@controlq.com,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Helge Deller <deller@gmx.de>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200709042344.30215.deller@gmx.de>
Resent-Message-ID: <KaF3JB.A.9nD.x4d3GB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Tue, Sep 04, 2007 at 11:44:29PM +0200, Helge Deller wrote:
> Additionally, does someone knows what this device is ?
> > 12. unknown device at 0xf190c000 [10/4/12] { 2, 0x0, 0x004, 0x0005f }

I don't.  We don't have anything with the 0x0005f programming model in
the database.  We have:

        {HPHW_A_DMA, 0x004, 0x00050, 0x80, "Lanbrusca 802.3 (36967A)"}, 
        {HPHW_B_DMA, 0x008, 0x00051, 0x80, "HP-PB Transit 802.3"}, 
        {HPHW_B_DMA, 0x004, 0x00052, 0x80, "Miura LAN/Console (J2146A)"}, 
        {HPHW_A_DMA, 0x004, 0x00056, 0x80, "HP-PB LoQuix FDDI"}, 
        {HPHW_A_DMA, 0x004, 0x00057, 0x80, "HP-PB LoQuix FDDI (28670A)"}, 
        {HPHW_B_DMA, 0x008, 0x00058, 0x80, "HP-PB Transit 802.4"}, 
        {HPHW_A_DMA, 0x004, 0x0005E, 0x00, "Gecko Add-on Token Ring"}, 

The owner could probably help us out by taking a look at the card in
slot 10/4/12 and seeing what chips are on it, and what connectors it has.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
