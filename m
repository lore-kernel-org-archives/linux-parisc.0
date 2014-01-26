From: Dave Land <xmechanic@landcomp.net>
Subject: Re: [C8000] serial console drops input
Date: Sat, 25 Jan 2014 18:01:29 -0700
Message-ID: <52E45E69.5000900@landcomp.net>
References: <20140125054144.4ccfde5e@marga.jer-c2.orkz.net>	<1417398.fmUESL4Ngr@eto>	<BLU0-SMTP1495AAE1C79CFA59BC915E97A00@phx.gbl>	<7905648.nun1s37FKj@eto>	<20140125181348.67a2bf8f@marga.jer-c2.orkz.net>	<BLU0-SMTP313201DB46978BF91A10FE97A00@phx.gbl> <20140126010218.33334dbd@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: John David Anglin <dave.anglin@bell.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>
To: Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140126010218.33334dbd@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1/25/14 5:02 PM, Jeroen Roovers wrote:
> On Sat, 25 Jan 2014 15:13:47 -0500
> John David Anglin <dave.anglin@bell.net> wrote:
>
>> Helge has made some changes to palo but I believe that we are on the
>> PDC boot
>> console (ttyB0) until switch over here:
>
> This.
>
>> How long is your cable?    There's no shield connection on DB9
>> connector.  You just
>> need to cross transmit and receive data.  Signal ground is straight
>> through.
>>
>> Dave L is correct about USB keyboard and mouse confusing serial
>> console support.
>
> Yes, but _all_ of that is entirely immaterial as the same hardware
> worked fine for more than one and a half years, _until_ the changes to
> palo/PDC console support were introduced.

Ahh, I missed that part... :-P I think I set mine up after this was 
introduced.

Dave L.

>
> I could easily revert the IPL to the former working version (1.18) and
> see if that fixes the issue during boot. I'll report back with some
> results.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>


-- 
Dave Land
Land Computer Service  xmechanic@landcomp.net
ICQ: 676030523


