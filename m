Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from jaguar.mkp.net (jaguar.mkp.net [66.11.169.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47C534829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 09:26:15 -0700 (MST)
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PA-RISC Linux RAID1 Root HOWTO
From: "Martin K. Petersen" <mkp@mkp.net>
References: <3E1AA7C1000015EB@ocpmta7.freegates.net>
Date: 15 Jan 2003 11:26:24 -0500
In-Reply-To: <3E1AA7C1000015EB@ocpmta7.freegates.net>
Message-ID: <yq1fzru4bwv.fsf@austin.mkp.net>
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

>>>>> "Joel" == jsoe0708  <jsoe0708@tiscali.be> writes:

Joel,

Joel> so, finaly, how to remumber md0 into md1 ...?

Why do you want to renumber it?  It's just an arbitrary name.


Joel> I would also ask you if you could advise me on the resizing of a
Joel> md.  My md7 is a raid1 with the last slices sda11 and sdb11 of
Joel> disks (mounted on /var). As there are still some free space at
Joel> the end of each disk, I would like to increase it. Could you
Joel> advise me howto do (I try to find doc but no success and my test
Joel> was not more succesfull and I do not want to loose the contents
Joel> of the fs)?

        http://unthought.net/raidreconf/index.shtml

Read the disclaimer carefully.

Once you've expanded the md device, you'll have to grow the
filesystem:

        http://ext2resize.sourceforge.net/

If I recall correctly, the ext3fs resizer isn't quite ready yet.  So
you may have to convert your filesystem back to ext2, resize it, and
then turn journalling back on.

-- 
Martin K. Petersen      http://mkp.net/
