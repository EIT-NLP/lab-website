// Mock projects data
// In a real application, this would fetch from an API or load from JSON files

export const projects = [
  {
    id: 1,
    title: "大语言模型中文理解能力评测",
    description: "构建全面的中文语言理解评测基准，涵盖语义理解、常识推理、数学推理等多个维度，为中文大模型的发展提供标准化评估工具。",
    image: "/src/assets/images/project-placeholder.jpg",
    link: "https://github.com/eit-nlp/chinese-llm-benchmark",
    tags: ["LLM", "Evaluation", "Chinese NLP"],
    links: [
      { name: "GitHub", url: "https://github.com/eit-nlp/chinese-llm-benchmark", icon: "fab fa-github" },
      { name: "Paper", url: "#", icon: "fas fa-file-pdf" }
    ]
  },
  {
    id: 2,
    title: "高效检索增强生成系统",
    description: "开发新一代检索增强生成(RAG)系统，通过优化检索算法和生成模型的协同工作，显著提升知识密集型任务的性能。",
    image: "/src/assets/images/project-placeholder.jpg",
    tags: ["RAG", "Information Retrieval", "LLM"],
    links: [
      { name: "Demo", url: "#", icon: "fas fa-external-link-alt" }
    ]
  },
  {
    id: 3,
    title: "多模态情感分析框架",
    description: "整合文本、语音、图像等多种模态信息，构建统一的情感分析框架，应用于社交媒体分析、客户服务等场景。",
    image: "/src/assets/images/project-placeholder.jpg",
    tags: ["Multi-modal", "Sentiment Analysis", "Deep Learning"],
    group: "more"
  }
]

export async function getProjects() {
  // Simulate API call
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(projects)
    }, 500)
  })
}