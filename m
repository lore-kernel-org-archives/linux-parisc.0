From: "Andy Walker" <andy@puszczka.com>
Subject: Re: [parisc-linux] ncr53c8xx patch for c110
Date: Mon, 21 Jun 2004 09:48:10 +0200 (CEST)
Message-ID: <47618.193.161.152.244.1087804090.squirrel@www.puszczka.com>
References: <40BD9F8700009BB8@ocpmta2.freegates.net><1087569206.2078.13.camel@mulgrave>
	<40D30E3C.1010809@tiscali.be> <40D34A27.8060009@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@parisc-linux.org
To: "Joel Soete" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40D34A27.8060009@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Hello James & Grant,
>
> Joel Soete wrote:
>>
>> otc I trust that backporting sym_scatter() into ncr_scatter() is a fix
>> ;) (i was not very sure)

<..snip..>

Patch works fine on the B132L too :-) As far as I know there wasn't
a problem here before (only Ravens seemed affected), but the patch
certainly didn't break anything! The machine has been constantly
compiling big packages (gnome/gtk/perl etc.) since the reboot,
including downloads from portage, large copies.. so the disk has
been getting a thrashing with no hiccoughs.

-Andy
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
