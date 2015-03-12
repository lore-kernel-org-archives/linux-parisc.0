From: John David Anglin <dave.anglin@bell.net>
Subject: Re: BUG: non-zero nr_pmds on freeing mm: -1
Date: Thu, 12 Mar 2015 16:47:50 -0400
Message-ID: <BLU437-SMTP580223CCACC748AB4A6A8897060@phx.gbl>
References: <BLU436-SMTP11459F3D9DC424BE50626A797190@phx.gbl> <CADjby3WS3cJs2BOmYT4Cdr4i9FncD=BYjrkuQiBH3=VmOndRPw@mail.gmail.com> <BLU436-SMTP234E13E9344CBB4D18CEB0D97190@phx.gbl> <CAFk90B8ZRnte0K-r8EBacx_WEEEL4fpTLkkVVgj42s1HO6QhFA@mail.gmail.com> <BLU436-SMTP233C66DF7A4433DBEA2897997060@phx.gbl> <20150312193556.GE587@fuloong-minipc.musicnaut.iki.fi> <BLU436-SMTP114E0E2B73148E5EE40047897060@phx.gbl> <20150312201535.GG587@fuloong-minipc.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Cc: Graham Gower <graham.gower@gmail.com>,
	Domenico Andreoli <cavokz@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	kirill@shutemov.name
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20150312201535.GG587@fuloong-minipc.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-03-12 4:15 PM, Aaro Koskinen wrote:
> Not sure if that would be correct. The fix disabled PMD accounting
> on 32-bit kernels because that level does not exist, but on
> 64-bit you probably would need it? Maybe your bug is different.
> Does it occur on every process exit, or just occasionally?
> (On 32-bit every exit triggered it.)
I would guess it occurs on every process exit.  Note it is mm -1 which I 
didn't see in any
of the other messages that I looked at.

Dave

-- 
John David Anglin  dave.anglin@bell.net

