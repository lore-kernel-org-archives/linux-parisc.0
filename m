From: Thibaut VARENE <varenet@esiee.fr>
Subject: Re: [parisc-linux] Support for 2.4.x kernels on hppa
Date: Mon, 24 May 2004 22:19:08 +0200
Message-ID: <20040524221908.0eee0174.varenet@esiee.fr>
References: <20040524183227.GW7207@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: tausq@debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040524183227.GW7207@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 24 May 2004 11:32:27 -0700
"Randolph Chung" <tausq@debian.org> wrote:

> Hi all,
> 
> I'd like to take an informal "survey" of what kernel versions people
> are using....
[snip]
> If you are one of those people who really care about 2.4 support,
> please speak up now! 

We're mostly using 2.4 on our production and devel machines, as the
following page shows:

http://www.pateam.org/realisations.html

Some of them could be switched to 2.6, but not the SMP ones, which are
64bit btw, until SMP is proven efficient on 2.6.

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://www.pateam.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
