Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Fwd: A500 hang up 2.4.19-pa18 (lot of) details 
In-Reply-To: Message from Thibaut VARENE <varenet@esiee.fr>
   of "Tue, 17 Sep 2002 19:16:52 +0200." <3D876384.1090200@esiee.fr>
References: <3D876384.1090200@esiee.fr> 
Date: Tue, 17 Sep 2002 12:42:35 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020917184235.A1C054829@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Thibaut VARENE wrote:
> This a forward to the p-l.o m-l about hang-up with 2.4.19-pa18 kernel, 
> that occurs when playing around with setiathome. See the transcript for 
> details.

I tried the same thing with setiathome on A500-4X (PA8500) and it
seems to work fine.
Thibaut is using A500-5X (PA8600) - same cache sizes as PA8500.
I was wondering if the is a problem with 4-way associative cache
or just higher clock speeds exposing bugs.

grant
