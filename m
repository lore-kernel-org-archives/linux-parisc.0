From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] X startup failure
Date: Wed, 28 Dec 2005 18:28:52 -0500 (EST)
Message-ID: <200512282328.jBSNSruQ029068@hiauly1.hia.nrc.ca>
References: <200512281719.26852.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: mszick@morethan.org (Michael S. Zick)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200512281719.26852.mszick@morethan.org> from "Michael S. Zick"
	at Dec 28, 2005 05:19:26 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Pardon the dumb question----
> 
> > Could not init font path element unix/:7100, removing from list!
> > Could not init font path element /usr/lib/X11/fonts/Speedo, removing from list!
> >
> Is xfs (X font server) still running?

root@hiauly6:/var/log# ps -ef|grep xfs
root      2159     1  0 Dec26 ?        00:00:00 /usr/bin/X11/xfs -daemon

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
