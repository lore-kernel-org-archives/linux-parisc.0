Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8C874859
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Mar 2004 17:24:58 -0700 (MST)
Date: Sat, 20 Mar 2004 17:24:57 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.5-rc1-pa1 hung on C110
Message-ID: <20040321002457.GA31600@colo.lackof.org>
References: <405CD7B7.6090007@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <405CD7B7.6090007@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Mar 20, 2004 at 11:45:59PM +0000, Joel Soete wrote:
> I just rebuild 2.6.5-rc1-pa1 kernel on my c110 with b180 config (minus hil 
> kbd and mouse support).

c110 requires ccio driver. B180 does not.
Is that included in the b180 config?

grant
