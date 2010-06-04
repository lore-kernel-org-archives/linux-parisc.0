From: Kyle McMartin <kyle@mcmartin.ca>
Subject: patch submission
Date: Fri, 4 Jun 2010 07:28:26 -0400
Message-ID: <20100604112826.GA20317@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi folks,

Manually munging changelogs is really tedious work and makes for an
unhappy Kyle. In the future, if you want to save me a lot of hair
pulling, and to make patchwork better for all of us, could we please do
a few kind things for me?

1. Patches that you want applied should start a new thread: It's really
difficult to see what the status of things is when several patches are
all jumbled up with a load of prior discussion.

2. Patches should be properly formatted for git-am: Patchwork
automatically adds Signed-off-by and certain other attributions if you
follow up to the list, which saves me having to note them and add them
myself. For reference, a patch should look like the following.

<MAIL_HEADERS>
From: Submitter
Subject: [PATCH] parisc: useful subject
Date: Self Explanatory
</MAIL_HEADERS>

<MAIL_BODY>
From: Patch Author if not Submitter

Patch description in here.

Signed-off-by: Patch Author
Acked-by: Someone else
Reviewed-by: Yet Another person

--- <- seperator between changelog and patch

Anything between seperator and the diff itself will not be in the patch
changelog, this is where you should put notes and such, please, as well
as a diffstat if it is a large patch series.

Diff goes here.
</MAIL_BODY>

I promise to be a lot quicker at sucking patches in and getting them
around if we can tighten up our process a bit.

Thanks, Kyle
