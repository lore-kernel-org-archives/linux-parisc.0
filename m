Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hermes.fachschaften.tu-muenchen.de (hermes.fachschaften.tu-muenchen.de [129.187.176.19])
	by dsl2.external.hp.com (Postfix) with SMTP id F41C8482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 10:34:21 -0600 (MDT)
Date: Wed, 29 May 2002 18:34:24 +0200 (CEST)
From: Andreas Deresch <aderesch@fs.tum.de>
Reply-To: Andreas Deresch <aderesch@fs.tum.de>
To: marc <marc@centraltx.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Java and SSH
In-Reply-To: <200205291125.AA386859468@mail.centraltx.com>
Message-ID: <Pine.NEB.4.44.0205291830380.25776-100000@tethys.fachschaften.tu-muenchen.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 29 May 2002, marc  wrote:

> The problem is per my original post that I do not have network
> yet, I just needed the Java and SSH stuff to do some work,
> but I guess I will wait until I get things up and running.
If you have network access somewhere else, you can still download the
package there and carry it home. apt-zip is a tool for automating that (get
the package lists, update your local cache, choose packages, then run
apt-zip-list, use the produced script to download the packages somewhere
else, then run apt-zip-inst back home).

ad
