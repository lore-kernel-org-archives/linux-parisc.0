From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Some warning: ... cleanup; relay no interest?
Date: Mon, 23 Jul 2007 22:38:11 +0200
Message-ID: <200707232238.11288.deller__8963.25093131072$1416624417$gmane$org@gmx.de>
References: <46A34724.1090108@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Joel Soete <soete.joel@scarlet.be>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <46A34724.1090108@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Joel,

On Sunday 22 July 2007, Joel Soete wrote:
> There was <http://lists.parisc-linux.org/pipermail/parisc-linux/2007-June/031749.html>
> 
> Really no interest, just missed or did I made a big mistake?

I don't like that patch very much.
It converts everything needlessly to (unsigned long long), which is 64bit long.

Wouldn't it be better to use "%z" or "%z"<something> ?
%z refers to size_t which should be the native bit length.
I'm not sure what others on this list think about it, or if this even works with 64bit...

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
