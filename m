From: John David Anglin <dave.anglin@bell.net>
Subject: Re: BUG: non-zero nr_pmds on freeing mm: -1
Date: Wed, 11 Mar 2015 20:21:35 -0400
Message-ID: <BLU436-SMTP233C66DF7A4433DBEA2897997060@phx.gbl>
References: <BLU436-SMTP11459F3D9DC424BE50626A797190@phx.gbl> <CADjby3WS3cJs2BOmYT4Cdr4i9FncD=BYjrkuQiBH3=VmOndRPw@mail.gmail.com> <BLU436-SMTP234E13E9344CBB4D18CEB0D97190@phx.gbl> <CAFk90B8ZRnte0K-r8EBacx_WEEEL4fpTLkkVVgj42s1HO6QhFA@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset="us-ascii"
Cc: Domenico Andreoli <cavokz@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	kirill@shutemov.name
To: Graham Gower <graham.gower@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAFk90B8ZRnte0K-r8EBacx_WEEEL4fpTLkkVVgj42s1HO6QhFA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-03-11, at 7:31 PM, Graham Gower wrote:

> I thought this patch was supposed to address the problem?
> https://lkml.org/lkml/2015/2/26/230
> 
> However, its not fixed it for me either in 4.0.0-rc3.

I doubt the patch is correct for parisc.  I believe the system where I saw the BUG messages
has PT_NLEVELS == 3.

Dave
--
John David Anglin	dave.anglin@bell.net



