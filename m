From: Rob Sciuk <rob@controlq.com>
Subject: Re: Unknown device 0x0005f
Date: Wed, 5 Sep 2007 11:01:02 -0400 (EDT)
Message-ID: <20070905105459.P34857__18612.3575469994$1416624433$gmane$org@saddam.controlq.com>
References: <20070828215632.R6291@saddam.controlq.com> <200709042213.25542.deller@gmx.de>
 <20070904172254.Q31055@saddam.controlq.com> <200709042344.30215.deller@gmx.de>
 <20070904221537.GV14130@parisc-linux.org> <20070904195341.E32489@saddam.controlq.com>
 <20070905015540.GX14130@parisc-linux.org>
Reply-To: rob@controlq.com
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII;
  format=flowed
Cc: Helge Deller <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20070905015540.GX14130@parisc-linux.org>
Resent-Message-ID: <pvBnGC.A.OND.eYs3GB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Tue, 4 Sep 2007, Matthew Wilcox wrote:

> 
> On Tue, Sep 04, 2007 at 07:56:23PM -0400, Rob Sciuk wrote:
>>> The owner could probably help us out by taking a look at the card in
>>> slot 10/4/12 and seeing what chips are on it, and what connectors it has.
>>
>> I can photograph it, if you like, how does one determine where slot
>> 10/4/12 is??  I know that there are a couple of mux boards on the back,
>> but frankly I haven't opened up the box as of yet.  Pointers?
>
> It's been a few years since I looked at the back of a K-class, but I
> believe the path '10/4/12' is silk-screened onto the outside of the case
> below the slot in question.

The roadmap on the back of the K200 points to the I/O panel, and indeed, 
the 10/4/12 device appears to be a BNC connecter to the AUI for 10Base2 
network adapter (yes, I know, it is ancient -- but it was handy.  I'll 
make up a 10BT cable which can reach the box, and replace the "unknown 
device" with 10BT).  At this point, this unknown device is a red herring 
IMHO.

The problem persists, however, and it seems unrelated to the unknown 
device, which is now lying pathetic, and abandoned on the floor of my 
machine room -- cast into the dust!) and no longer is mentioned in the 
boot log -- the panic occurs at the same spot, after freeing memory.

Rob.


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
