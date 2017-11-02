From: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: HP-UX for C8000
Date: Thu, 2 Nov 2017 17:38:31 +0100
Message-ID: <20171102163831.GA14357@alpha.franken.de>
References: <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net>
 <45425BF6-26D1-4232-957D-F3F057A8966A@bell.net>
 <d6efa26f-9daf-a42f-c4e8-a2f050faf322@gmx.de>
 <8A61C252-CA15-44AB-9225-EAA6C259E872@bell.net>
 <20171009174146.GA21988@alpha.franken.de>
 <7521862C-4EC7-47F5-AFF9-41A44775CFAB@bell.net>
 <20171010184621.GA18582@alpha.franken.de>
 <5CF7B86C-F92C-4CED-8A90-A11ABCFBE6B4@bell.net>
 <945027596.2687.1509587833744.JavaMail.zimbra@basstech.net>
 <9774ee1b-850d-bba3-774c-ee923fa76f64@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: Brendan Horan <brendanhoran@basstech.net>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <9774ee1b-850d-bba3-774c-ee923fa76f64@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Nov 02, 2017 at 10:25:23AM -0400, John David Anglin wrote:
> On 2017-11-01 9:57 PM, Brendan Horan wrote:
> >If you did not manage to find some media, I have the following I can send :
> >HPUX 11.23 Core FOE. Dec 2005
> I believe Tom has 11.11 installed and is trying to access the Quicksilver
> adapter setup.  Does your
> media have kwdb on it?

in fact I've made some progress today. I now have a loadable module,
which dumps whatever I want, when it's loaded. And the first thing
I've detected is that I'm missing a package named Graphics Technical
Computing Environment and that a radeon 7000 card will not use
DMA over AGP (which means I have to install a firegl in my test machine).

I'm using 11.11 since 11.31 doesn't install and rumours are that 11.23
will also not install.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
