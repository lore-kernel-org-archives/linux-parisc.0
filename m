Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with SMTP id D4DC24829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Aug 2002 08:23:21 -0600 (MDT)
Date: Tue, 20 Aug 2002 16:23:15 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Oracle 9i on PARISC-LINUX
Message-ID: <20020820142315.GI13589@charite.de>
References: <200208201049.AA167248046@intercommerce.com.br> <20020820141813.GB4865@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020820141813.GB4865@systemhalted>
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

On Tue, Aug 20, 2002 at 10:18:13AM -0400, Carlos O'Donell wrote:

> apt-get install oracle-9i
> Reading Package Lists... Done
> Building Dependency Tree... Done
> E: Couldn't find package oracle-9i

The correct approach would be to use 

apt-cache search oracle

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
"I've not lost my mind. It's backed up on tape somewhere." - Unknown
