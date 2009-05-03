From: Dirk Van Hertem <dirk.vanhertem@ieee.org>
Subject: Re: random freezes B2000 running debian hppa lenny
Date: Mon, 04 May 2009 01:07:06 +0200
Message-ID: <49FE239A.2000807@ieee.org>
References: <49FB108B.9030803@ieee.org> <20090503112554.GB6617@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090503112554.GB6617@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Grant,

Thanks for the reply.

Grant Grundler wrote:
[Dirk's problems with HP and promise card removed]
>> So, my questions:
>> * Is this sata promise card the fault?
> 
> Likely, yes.
> 
>> * on the web, the errors on the display seemed to indicate hardware
>> problems, but any insight on that?
> 
> HW caught the error. Unless this happens w/o Promise care present,
> I'm not inclined to believe this is a HW problem.

I am now running it without the promise card, I'll keep you informed
whether it blocks or not (I'll run a small program on it to give it some
cpu load, as the mdadm raid stuff also gave it quite some cpu load and
it still may be a HW fault).

> 
>> * Best ways to solve this?
> 
> Capture "ser pim" output (aka PIM dump).

If that doesn't kill the machine in a day or so, I'll make sure I'll get
some output from the serial console with the promise card attached. My
VT220 seems to have died recently (do you happen to know what a black
screen and blinking "hold screen" and "lock" lights mean on a real VT220?).

In case I don't get the VT220 working, I'll make sure I'll connect using
minicom (if I just find that nullmodem cable and the adapter of that old
laptop with serial port :P).

Thanks for the help!

Dirk

ps: I could put my sata disks in an old i386 of course, but I like the
hp parisc better...


-- 
Dirk Van Hertem                       Dirk.VanHertem@esat.kuleuven.be
Electrical Engineering Department  http://www.esat.kuleuven.be/electa
K.U. Leuven, ESAT-ELECTA                         tel: +32-16-32.18.95
10, Kasteelpark Arenberg, B-3001 Heverlee        fax: +32-16-32.19.85
