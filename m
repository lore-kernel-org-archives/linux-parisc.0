Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3637F40DFD3
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 18:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775586718; cv=none; b=KM0ZQ8pbq8UzWkmacTLfQEfXSsxplsqDgL4p3QkPt8GpWGT9xQd2iXhpm2wc2vLFMNfwEdx+ixKEkHjFKRbOg39xLnM1c1mUjV0IzSTvxcW+61awO4ibcyHNSFWyACN0TYLD7V+mPd7wy6qQ7ajPkocA0cbxMkCs9DfMmfvYU6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775586718; c=relaxed/simple;
	bh=D77PbhFnUTXEYecPTxm8SWRtqxRCSJRKjEMWgInMrn0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GtAOmso7QGeiDSjnZY2TLOMta9ueFeZhGSPRqlxbUP++duL6Um/cvVUPfNkaV1Zcht490BzjWvENStmVDEigovv0fpCNTTNmtwOd4wqifNUaNjAk11UWZGpDqEZU3Te/0HcV0fno3fwec9EMHg+vu4/Bw//iQ6TBTO9mo6m3J4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZj4aqH7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZj4aqH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAF9C116C6;
	Tue,  7 Apr 2026 18:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775586717;
	bh=D77PbhFnUTXEYecPTxm8SWRtqxRCSJRKjEMWgInMrn0=;
	h=Date:From:To:Subject:From;
	b=JZj4aqH7bhGMlLR0OVioc8KaYNEmHqv9uh3mJbf8mYFeREoDJLmEc8G8C0gUHoZft
	 jc2NexsF4ZmnFrM84kn8ARTQ8pqtHv0D5Bkef5kNoJF+fuBJ8HVhJIbHOdJ2dLm1AI
	 ohz5Pi/Z7yPf0iBcZWhuBejtW+1cWpFus4whWE5GcY0HThv7HJ1lAADU7lEHRFDzc/
	 9lEtQENR2DVrIMIXy6hfjg7Czy+KEUd/DvDVN8gjWNa3g0ix0HYv3uM9qhYi6Q3ph/
	 ItnYf/oXqthbd/9GoJw/u5Guau1kxNQSUYHTHYhWCs9GghGCcmkO8lrdDy/I7nvKsU
	 yLZpZSi1iJ8vA==
Date: Tue, 7 Apr 2026 20:31:54 +0200
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH] net: Avoid unaligned access in inet_gro_receive()
Message-ID: <adVNmmHOtaX65KIJ@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On the parisc platform the following unaligned accesses are reported regularily:

 Kernel: unaligned access to 0x173d22e76 in inet_gro_receive+0xbc/0x2e8 (iir 0x0e8810b6)
 Kernel: unaligned access to 0x173d22e7e in inet_gro_receive+0xc4/0x2e8 (iir 0x0e88109a)
 Kernel: unaligned access to 0x173d22e82 in inet_gro_receive+0xc8/0x2e8 (iir 0x0e90109d)
 Kernel: unaligned access to 0x173d22e7a in inet_gro_receive+0xd0/0x2e8 (iir 0x0e9810b8)
 Kernel: unaligned access to 0x173d22e86 in inet_gro_receive+0xdc/0x2e8 (iir 0x0e8810b8)

Avoid those unaligned accesses by using the get_unaligned_xx() helpers.
While converting the code, I noticed that while calculating the flush variable
we canuse the 16-bit accessors instead of the 32-bit ones, and the flush
variable should be of type __u16 and doesn't need to be initialized.

Note: Since I don't know the network details, I'm not sure if "~IP_DF"
(~0x4000) is correct, or if "IP_OFFSET" (0x1FFF) should be used instead (which
I think would be more correct). Instead of breaking things I left it as is.

Note 2: Patch still needs runtime testing, so I sent to parisc-linux mailing
list only for now..

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index c7731e300a44..9a0d192b2b35 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1479,7 +1479,7 @@ struct sk_buff *inet_gro_receive(struct list_head *head, struct sk_buff *skb)
 	struct sk_buff *p;
 	unsigned int hlen;
 	unsigned int off;
-	int flush = 1;
+	__u16 flush;
 	int proto;
 
 	off = skb_gro_offset(skb);
@@ -1504,7 +1504,8 @@ struct sk_buff *inet_gro_receive(struct list_head *head, struct sk_buff *skb)
 		goto out;
 
 	NAPI_GRO_CB(skb)->proto = proto;
-	flush = (u16)((ntohl(*(__be32 *)iph) ^ skb_gro_len(skb)) | (ntohl(*(__be32 *)&iph->id) & ~IP_DF));
+	flush = (get_unaligned_be16(&iph->tot_len) ^ skb_gro_len(skb)) |
+	        (get_unaligned_be16(&iph->frag_off) & ~IP_DF);
 
 	list_for_each_entry(p, head, list) {
 		struct iphdr *iph2;
@@ -1519,8 +1520,8 @@ struct sk_buff *inet_gro_receive(struct list_head *head, struct sk_buff *skb)
 		 * at the same offset.
 		 */
 		if ((iph->protocol ^ iph2->protocol) |
-		    ((__force u32)iph->saddr ^ (__force u32)iph2->saddr) |
-		    ((__force u32)iph->daddr ^ (__force u32)iph2->daddr)) {
+		    (get_unaligned(&iph->saddr) ^ get_unaligned(&iph2->saddr)) |
+		    (get_unaligned(&iph->daddr) ^ get_unaligned(&iph2->daddr))) {
 			NAPI_GRO_CB(p)->same_flow = 0;
 			continue;
 		}
