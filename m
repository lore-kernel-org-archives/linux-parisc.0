Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: marc@centraltx.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Boot Order 
In-Reply-To: Message from "marc " <marc@centraltx.com>
   of "Sat, 07 Sep 2002 16:00:50 CDT." <200209071600.AA32899526@mail.centraltx.com>
References: <200209071600.AA32899526@mail.centraltx.com> 
Date: Sat, 07 Sep 2002 15:57:55 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020907215755.7904C482A@dsl2.external.hp.com>
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

"marc " wrote:
> Oh one last question, how can I change the default boot
> from P0 to P1? Everything works fine if I do a SEA then BO P1
> at startup, and I want to make this the default.

pa pri fwscsi.X.0 (or something like that).

Type "help" or "he path" from the config menu.
It will explain how to set "Primary Boot path".

grant
