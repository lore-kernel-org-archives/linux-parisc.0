Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12505.mail.yahoo.com (web12505.mail.yahoo.com [216.136.173.197])
	by dsl2.external.hp.com (Postfix) with SMTP id 6EE64482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Sep 2002 19:09:10 -0600 (MDT)
Message-ID: <20020908010908.75589.qmail@web12505.mail.yahoo.com>
Date: Sat, 7 Sep 2002 18:09:08 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Boot Order 
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020907215755.7904C482A@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

And if you want it to start automatically from that path you have to
set autoboot to on.  Autoboot and the path commands are in the
Configuration menu (co from the ma prompt).

derek 

--- Grant Grundler <grundler@dsl2.external.hp.com> wrote:
> "marc " wrote:
> > Oh one last question, how can I change the default boot
> > from P0 to P1? Everything works fine if I do a SEA then BO P1
> > at startup, and I want to make this the default.
> 
> pa pri fwscsi.X.0 (or something like that).
> 
> Type "help" or "he path" from the config menu.
> It will explain how to set "Primary Boot path".
> 
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


__________________________________________________
Do You Yahoo!?
Yahoo! Finance - Get real-time stock quotes
http://finance.yahoo.com
