Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Making SYM2 default SYM-SCSI driver instead of SYM1 
In-Reply-To: Message from Thibaut VARENE <varenet@esiee.fr>
   of "Sat, 14 Sep 2002 12:14:53 +0200." <CFEA4CE8-C7CA-11D6-BDC5-0030656F07A2@esiee.fr>
References: <CFEA4CE8-C7CA-11D6-BDC5-0030656F07A2@esiee.fr> 
Date: Sat, 14 Sep 2002 16:59:11 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020914225912.2AE904829@dsl2.external.hp.com>
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
> though IIRC, Randolph Chung mentioned
> that sym1 is b0rken in Linux 2.5.

It won't always be broken.

> Anyway, I think we can start with making sym2 default for PA2.0,
> keeping sym1 for PA1.1, and then "wait and see".
> 
> If everything goes well, we can switch PA1.1 as well.

If we switch PA1.1, then we should do that for both releases.
And when we do so, better add a FAQ about "SCSI Controller not found".
Maybe even add it now already to cover PA2.0 case (but don't mention
PA2.0 in the FAQ).

grant
