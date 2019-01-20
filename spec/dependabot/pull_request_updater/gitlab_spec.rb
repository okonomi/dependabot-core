# frozen_string_literal: true

require "octokit"
require "spec_helper"
require "dependabot/dependency"
require "dependabot/dependency_file"
require "dependabot/pull_request_updater/gitlab"

RSpec.describe Dependabot::PullRequestUpdater::Gitlab do
  subject(:updater) do
    described_class.new(
    )
  end

  let(:source) do
    Dependabot::Source.new(provider: "gitlab", repo: "gitlab-org/gitlab-ce")
  end
  let(:watched_repo_url) { "https://api.gitlab.com/projects/#{source.repo}" }

  describe "#update" do
    context "when the branch doesn't exist" do
      it "doesn't push a commit to GitLab" do
        updater.update
        expect(WebMock).
          to_not have_requested(:post, "#{watched_repo_url}/git/trees")
      end

      it "returns nil" do
        expect(updater.update).to be_nil
      end
    end

    it "pushes a commit to GitLab" do
    end

    context "with a submodule" do
      it "pushes a commit to GitLab" do
      end
    end

    it "has the right commit message" do
    end

    context "with multiple commits on the branch" do
      it "has the right commit message" do
      end
    end

    context "when the default branch has changed" do
      it "updates the base branch" do
      end

      context "but this PR wasn't targeting the default branch" do
        it "does not update the base branch" do
        end
      end
    end

    context "with author details" do
      it "passes the author details to GitLab" do
      end

      context "with a signature key" do
        it "passes the author details and signature to GitLab" do
        end

        it "signs the correct text, correctly" do
        end
      end
    end

    it "updates the PR's branch to point to that commit" do
    end

    it "returns details of the updated branch" do
    end

    context "when the branch gets deleted mid-flow" do
      it "returns nil" do
      end
    end
  end
end
