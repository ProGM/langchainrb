# frozen_string_literal: true

require "logger"
require "pathname"

require_relative "./version"
require_relative "./dependency_helper"

module Langchain
  class << self
    attr_accessor :logger

    attr_reader :root
  end

  @logger ||= ::Logger.new($stdout, level: :warn, formatter: ->(severity, datetime, progname, msg) { "[LangChain.rb] #{msg}\n" })

  @root = Pathname.new(__dir__)

  autoload :Loader, "langchain/loader"
  autoload :Data, "langchain/data"

  module Processors
    autoload :Base, "langchain/processors/base"
    autoload :CSV, "langchain/processors/csv"
    autoload :Docx, "langchain/processors/docx"
    autoload :HTML, "langchain/processors/html"
    autoload :JSON, "langchain/processors/json"
    autoload :JSONL, "langchain/processors/jsonl"
    autoload :PDF, "langchain/processors/pdf"
    autoload :Text, "langchain/processors/text"
  end

  module Utils
    autoload :TokenLengthValidator, "langchain/utils/token_length_validator"
  end
end

module Agent
  autoload :Base, "agent/base"
  autoload :ChainOfThoughtAgent, "agent/chain_of_thought_agent/chain_of_thought_agent.rb"
end

module Vectorsearch
  autoload :Base, "vectorsearch/base"
  autoload :Chroma, "vectorsearch/chroma"
  autoload :Milvus, "vectorsearch/milvus"
  autoload :Pinecone, "vectorsearch/pinecone"
  autoload :Pgvector, "vectorsearch/pgvector"
  autoload :Qdrant, "vectorsearch/qdrant"
  autoload :Weaviate, "vectorsearch/weaviate"
end

module LLM
  autoload :Base, "llm/base"
  autoload :Cohere, "llm/cohere"
  autoload :GooglePalm, "llm/google_palm"
  autoload :HuggingFace, "llm/hugging_face"
  autoload :OpenAI, "llm/openai"
  autoload :Replicate, "llm/replicate"
end

module Prompt
  require_relative "prompt/loading"

  autoload :Base, "prompt/base"
  autoload :PromptTemplate, "prompt/prompt_template"
  autoload :FewShotPromptTemplate, "prompt/few_shot_prompt_template"
end

module Tool
  autoload :Base, "tool/base"
  autoload :Calculator, "tool/calculator"
  autoload :SerpApi, "tool/serp_api"
  autoload :Wikipedia, "tool/wikipedia"
end
