Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.73.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id A1268484F
	for <parisc-linux@parisc-linux.org>; Wed, 20 Feb 2002 13:34:45 -0700 (MST)
Date: Wed, 20 Feb 2002 21:34:39 +0100
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Fix for anon CVS problem
Message-ID: <20020220203439.GN18569@charite.de>
References: <E16dag5-00051i-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E16dag5-00051i-00@noam.fc.hp.com>
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

On Wed, Feb 20, 2002 at 10:37:13AM -0700, Paul Bame wrote:
> 
> Use
>     $ cvs -d :pserver:anonymous@cvs.parisc-linux.org:/var/cvs login
> not
>     $ cvs -d :pserver:anonymous@cvs.parisc-linux.org:/var/cvs/ login

Excellent. Works now.

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Confucius says: He who play in root, eventually kill tree.
