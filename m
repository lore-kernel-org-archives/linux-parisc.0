From: Matt Turner <mattst88@gmail.com>
Subject: Re: False advertising (was: C8000 cpu upgrade problem)
Date: Sat, 23 Oct 2010 13:14:39 -0400
Message-ID: <AANLkTimSda7Ki+uUW-hgkxhMhjeP7R5N3wkHb-hTyb4L@mail.gmail.com>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz>
 <AANLkTi=YJJgP-tDhh2g6D8d8BkKa-ENoJankd-ZMV+i2@mail.gmail.com>
 <alpine.DEB.1.10.1010231118350.23687@artax.karlin.mff.cuni.cz>
 <AANLkTikD5cvJdAxUg7zj0ySM9z6fThE-9H9txVpNC9Ez@mail.gmail.com>
 <alpine.DEB.1.10.1010231620190.12135@artax.karlin.mff.cuni.cz> <1287853058.3003.18.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	"Carlos O'Donell" <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1287853058.3003.18.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Oct 23, 2010 at 12:57 PM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Sat, 2010-10-23 at 16:46 +0200, Mikulas Patocka wrote:
>>
>> On Sat, 23 Oct 2010, Carlos O'Donell wrote:
>>
>> > On Sat, Oct 23, 2010 at 5:21 AM, Mikulas Patocka
>> > <mikulas@artax.karlin.mff.cuni.cz> wrote:
>> > > On Fri, 22 Oct 2010, Carlos O'Donell wrote:
>> > >> AFAIK you can't add a second CPU without an HP technician enabl=
ing the
>> > >> firmware for a second CPU.
>> > >>
>> > >> The same goes for enabling additional PCI slots.
>> > >>
>> > >> Cheers,
>> > >> Carlos.
>> > >
>> > > And is there some hack that enables it?
>> > >
>> > > It looks quite dishonest to me when the machine is advertised as=
 capable
>> > > of two dual-core CPUs, 32GB RAM, 4 PCI-X slots ... and you get t=
his
>> > > advertised capability only if you buy expensive support contract=
 :-(
>> >
>> > I know of no hack.
>> >
>> > It is not dishonest, the original purchase contract for the machin=
e
>> > probably said "1 active CPU slot" and "1 active PCI-X slot."
>> >
>> > Cheers,
>> > Carlos.
>>
>> It looks like false advertising to me. It is immoral (and in many
>> countries illegal) to advertise the product having some capabilities=
 and
>> then selling the product not having the capabilities. Purchase contr=
act is
>> irelevant, what is relevant are the public statements about the prod=
uct
>> and the real status of the product.
>
> It's fairly standard for the enterprise space: =A0Both HP and IBM act=
ually
> sell boxes fully loaded but disable unpaid for capabilities in the
> firmware (i.e. sell you a 2-cpu box that really contains 4 cpus so th=
ey
> then sell a firmware upgrade as two extra cpus); enterprise users
> actually like the convenience of not having to haul away and replace =
the
> box.
>
>> HP claims that c8000 workstation is extendible to two processors. Su=
ch
>> claims are implicit (feature lists, listing up to two dual core 1.1G=
Hz
>> processors) and explicit (citing
>> http://www.hp.com/workstations/white_papers/docs/hp_workstation_c800=
0_po.pdf
>> "Robust expansion capabilities, including two processor sockets and =
four
>> disk bays, let you grow and configure the system as needed").
>
> My garage is extensible too ... but I'd still have to pay a builder t=
o
> build the extension.

You forgot the part where you have to buy a support contract with the
builder for a one-off project.

Oh, and the part where you're more than capable of doing the building
yourself, but you can't because the builder hasn't approved the lumber
you bought to work with your particular mode of garage.

>> HP sells a computer that it claims to be c8000 and that the user can=
not
>> expand to two processors, contrary to the claims in the whitepaper.
>
> The whitepaper only claims they are extensible (which they are) it
> doesn't claim the user can do the extension (because they can't).
>
>> These claims really deceive users, both me and the person who sold m=
e the
>> CPU were deceived by them.
>>
>> Anyone living in the US and wanting to file a complain to FTC about =
these
>> computers falsely advertised as expandable? :)
>
> The FTC would take the view that it's standard industry practise and
> that you didn't do due diligence ...
>
> However, why don't you try what we usually do? =A0That's ask HP nicel=
y
> (via someone in their linux department) for the firmware upgrade; it'=
s
> mostly worked in the past ... assuming you haven't antagonised them t=
oo
> much by calling them liars and cheats, that is ...

Poor HP.

Seriously though. From a glance, the C8000 seems to be the most
capable PA-RISC system for someone who wants to help with
Linux-on-PARISC. Clearly, people like upgrading (and being able to
upgrade) their computers. If I were to buy a C8000 I'd be interested
in figuring out how to find a second CPU, add more RAM, and install
another PCI card. But these debilitating restrictions prevent any of
this.

So, my question is, if you and Carlos knew about this previously
(which I assume you did by your responses, but I may be wrong) then
why can I not find this information anywhere on parisc-linux.org or in
the appropriate mailing list archives?

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
